/*
 * Test FFT application in software and hardware
 */

#include <complex>
#include "32fft.h"
#include "xfft.h"
#include "xcounter.h"

#define TOL 0.1
#define NORM(x) ((x) * (x)).real()

void writeToFFT(XFft* xfptr, float *dr, float *di)
{
	XFft_Write_data_IN_M_real_Words(xfptr, 0, (int *)(dr), N);
	XFft_Write_data_IN_M_imag_Words(xfptr, 0, (int *)(di), N);
}

void readFromFFT(XFft* xfptr, float *dr, float *di)
{
	XFft_Read_data_OUT_M_real_Words(xfptr, 0, (int *)(dr), N);
	XFft_Read_data_OUT_M_imag_Words(xfptr, 0, (int *)(di), N);
}

void dispf(float a) {
	int q = a;
	if (a < 0) q--;
	int r = (1000 * (a-q));
	xil_printf("%d.%03d", q, r);
}

int main()
{
	XFft xf;
	XFft* xfptr = &xf;
	XCounter xc;
	XCounter* xcptr = &xc;

	int ctr, t1, t2, ts;
	int t3, t4, tw, th, tr;

	float in_r[32], in_i[32];
	float out_r[32], out_i[32];
    data_comp data_in[N]={
#include "inp_cpp.txt"
    };
    data_comp data_out[N];
    data_comp data_exp[N] = {
#include "out_cpp.txt"
    };
    for (int i=0; i<N; i++) {
    	in_r[i] = data_in[i].real();
    	in_i[i] = data_in[i].imag();
    }

    XFft_Initialize(xfptr, 0);
    XCounter_Initialize(xcptr, 0);
    XCounter_EnableAutoRestart(xcptr);
    XCounter_Start(xcptr);

	int result=0;
	int hwres = 0;

	t1 = XCounter_Get_return(xcptr);
	FFT(data_in,data_out);
	t2 = XCounter_Get_return(xcptr);
	ts = t2 - t1;

	for(int k=0;k<N;k++){
		if(NORM(data_exp[k]-data_out[k])>TOL) {
			xil_printf("SW-ERROR: [%d] \t ", k);
			dispf(data_out[k].real());
			xil_printf(" vs exp:\t ");
			dispf(data_exp[k].real());
			xil_printf("\r\n");
			result ++;
		}
	}

	t1 = XCounter_Get_return(xcptr);
	writeToFFT(xfptr, in_r, in_i);
	t2 = XCounter_Get_return(xcptr);
	XFft_Start(xfptr);
	while (!XFft_IsDone(xfptr) && (ctr < 1000)) ctr++;
	if (ctr == 1000) {
		xil_printf("Timed out! Expect errors...\r\n");
	} else {
//		xil_printf("Finished with ctr = %d\r\n", ctr);
	}
	t3 = XCounter_Get_return(xcptr);
	readFromFFT(xfptr, out_r, out_i);
	t4 = XCounter_Get_return(xcptr);

	for (int i=0; i<N; i++) {
		if (NORM(data_exp[i] - data_comp(out_r[i], out_i[i]))>TOL) {
			xil_printf("HW-ERROR: [%d] \t ", i);
			dispf(out_r[i]);
			xil_printf(" vs exp:\t ");
			dispf(data_exp[i].real());
			xil_printf("\r\n");
			hwres ++;
		}
	}

	if (result != 0) {
		xil_printf("FAIL SW: %d errors\r\n", result);
	} else if (hwres != 0) {
		xil_printf("FAIL HW: %d errors\r\n", hwres);
	} else {
		xil_printf("PASS\r\n");
	}

	xil_printf("SW Cycles: %d\r\n", ts);
	xil_printf("WriteToFFT cycles: %d\r\n", t2-t1);
	xil_printf("Compute FFT cycles: %d\r\n", t3-t2);
	xil_printf("ReadFromFFT cycles: %d\r\n", t4-t3);

    return result + hwres;

}
