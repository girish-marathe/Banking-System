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
import java.util.HashSet;
import java.util.Iterator;

public class Decoder {

    int gen;
    int k;

    public Decoder(int gen, int k) {
        this.gen = gen;
        this.k = k;
    }

    public static void printMatrix(char[][] A) {
        for (int i = 0; i < A.length; i++) {
            for (int j = 0; j < A[i].length; j++) {
                System.out.print((int) A[i][j] + " ");
            }
            System.out.println("");
        }
    }

    public static void printMatrix(int[][] A) {
        for (int i = 0; i < A.length; i++) {
            for (int j = 0; j < A[i].length; j++) {
                System.out.print((int) A[i][j] + " ");
            }
            System.out.println("");
        }
    }

    public int[] gaussianElimination257(int[][] A, int[] c) {
        int[] m = new int[k];
        for (int i = 0; i < k; i++) {
            FiniteField a = new FiniteField(A[i][i]);
            FiniteField inv = a.getInverse();
            for (int j = i + 1; j < k; j++) {

                FiniteField b = new FiniteField(A[j][i]);
                if (A[j][i] != 0) {
                    b = new FiniteField(257 - A[j][i]);
                }
                b = b.mult(inv);
                for (int k = 0; k < this.k; k++) {
                    FiniteField v = new FiniteField(A[i][k]);
                    A[j][k] = v.mult(b).add(A[j][k]).val;
                }
                FiniteField v = new FiniteField(c[i]);
                c[j] = v.mult(b).add(c[j]).val;

            }
        }

        // A is now in row-echelon form
        for (int i = k - 1; i >= 0; i--) {

            FiniteField sum = new FiniteField(0);
            for (int j = k - 1; j > i; j--) {
                FiniteField v = new FiniteField(A[i][j]);
                sum = v.mult(m[j]).add(sum);
            }

            FiniteField a = new FiniteField(A[i][i]);
            FiniteField inv = a.getInverse();
            FiniteField right = (new FiniteField(c[i])).minus(sum); //new FiniteField(FiniteField.minus(c[i], sum.val));
            m[i] = right.mult(inv).val;
        }

        return m;
    }

    public int[] decode(int[] allC, HashSet<Integer> bad) {
        FiniteField.init();
        FiniteField wn = new FiniteField(1);
        int[][] A = new int[k][k];
        int[] c = new int[k];
        int[] m = new int[k];
        int cnt = 0;
        Iterator itr = bad.iterator();
        while (itr.hasNext()) {
            System.out.println(itr.next());
        }
        for (int i = 0; i < allC.length; i++) {
            if (i != 0) {
                wn = wn.mult(gen);
            }
            if (bad.contains(i)) {
                continue;
            }

            FiniteField cur = new FiniteField(1);
            for (int j = 0; j < k; j++) {
                A[cnt][j] = cur.val;
                cur = cur.mult(wn);
            }
            c[cnt] = allC[i];

            cnt++;
            if (cnt >= k) {
                break;
            }
        }

        m = gaussianElimination257(A, c);

        return m;
    }

}
