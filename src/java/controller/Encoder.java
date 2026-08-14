/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author PTPL-02
 */
public class Encoder {

    int k, n, s;
    String input;
    char gen;

    public Encoder(String m, int s, char gen) {
        input = m;
        k = m.length();
        this.s = s;
        n = 2 * s + k;
        this.gen = gen;
    }

    public int[] encoding() {

        char[] cin = input.toCharArray();
        int[] m = new int[n];
        for (int i = 0; i < n; i++) {
            m[i] = 0;
            if (i < cin.length) {
                m[i] = cin[i];
            }
        }
        int[] c = new int[n];

        FiniteField wn = new FiniteField(1);
        int[][] A = new int[n][n];
        for (int i = 0; i < n; i++) {

            FiniteField cur = new FiniteField(1);

            FiniteField tot = new FiniteField(0);

            for (int j = 0; j < n; j++) {
                A[i][j] = cur.val;
                tot = cur.mult(m[j]).add(tot);
                cur = cur.mult(wn);
            }
            wn = wn.mult(gen);
            c[i] = tot.val;
        }
        return c;
    }

    public int[] fast() {
        char[] cin = input.toCharArray();
        int[] intIn = new int[cin.length];
        for (int i = 0; i < cin.length; i++) {
            intIn[i] = (int) cin[i];
        }
        return FFT(intIn);
    }

    public int[] FFT(int[] a) {
        int size = n;
        size = 256;
        int[] b = new int[size];
        for (int i = 0; i < b.length; i++) {
            b[i] = 0;
        }
        for (int i = 0; i < a.length; i++) {
            b[i] = a[i];
        }
        return doFFT(b, gen);
    }

    public String toString(int[] a) {
        String s = "";
        for (int a1 : a) {
            s = s + a1 + ", ";
        }
        return s;
    }

    public int[] doFFT(int[] a, int gen) {
        if (a.length == 1) {
            return a;
        }
        int wn = gen;
        FiniteField w = new FiniteField(1);

        int[] U = new int[a.length / 2];
        int[] V = new int[a.length / 2];
        for (int i = 0; i < a.length; i++) {
            if (i % 2 == 0) {
                U[i / 2] = a[i];
            } else {
                V[i / 2] = a[i];
            }
        }

        int[] y0 = doFFT(U, (new FiniteField(gen)).mult(gen).val);
        int[] y1 = doFFT(V, (new FiniteField(gen)).mult(gen).val);
        int[] y = new int[a.length];

        for (int i = 0; i < a.length; i++) {
            y[i] = w.mult(y1[i % (a.length / 2)]).add(y0[i % (a.length / 2)]).val;
            w = w.mult(gen);
        }
        return y;
    }

}
