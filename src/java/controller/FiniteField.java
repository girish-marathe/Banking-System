/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.HashSet;

/**
 *
 * @author PTPL-02
 */
public class FiniteField {

    public static int[][] adds;
    public static int[][] subtracts;
    public static int[][] mults;
    public static int[] inverse;
    public static boolean[][] addsDone;
    public static boolean[][] subtractsDone;
    public static boolean[][] multsDone;
    public static boolean[] inverseDone;

    public static final char PX = (char) 0x11B;

    public static void init() {
        int max = 257;
        adds = new int[max][max];
        mults = new int[max][max];
        subtracts = new int[max][max];
        addsDone = new boolean[max][max];
        multsDone = new boolean[max][max];
        subtractsDone = new boolean[max][max];
        inverse = new int[max];
        inverseDone = new boolean[max];
        for (int i = 0; i < adds.length; i++) {
            inverse[i] = 0;
            inverseDone[i] = false;
            for (int j = 0; j < adds[0].length; j++) {
                adds[i][j] = 0; //add(i,j);
                mults[i][j] = 0;
                subtracts[i][j] = 0;
                addsDone[i][j] = false;
                multsDone[i][j] = false;
                subtractsDone[i][j] = false;
            }
        }
    }

    public static int minus(int a, int b) {
        int c = a - b % 257;
        if (c >= 0) {
            return c;
        }
        return (257 + c) % 257;
    }

    public static int add(int a, int b) {
        return (a + b) % 257;
    }

    public static int mult(int a, int b) {
        int c = (a * b) % 257;
        return c;
    }

    int val;

    public FiniteField(int val) {
        this.val = val;
    }

    public FiniteField add(int b) {
        if (!addsDone[val][b]) {
            adds[val][b] = add(val, b);
            adds[b][val] = adds[val][b];
            addsDone[val][b] = true;
            addsDone[b][val] = true;
        }
        return new FiniteField(adds[val][b]);
    }

    public FiniteField add(FiniteField b) {
        return add(b.val);
    }

    public FiniteField minus(int b) {
        if (!subtractsDone[val][b]) {
            subtracts[val][b] = minus(val, b);
            subtractsDone[val][b] = true;
        }
        return new FiniteField(subtracts[val][b]);
    }

    public FiniteField minus(FiniteField b) {
        return minus(b.val);
    }

    public FiniteField mult(int b) {

        if (!multsDone[val][b]) {
            mults[val][b] = mult(val, b);
            mults[b][val] = mults[val][b];
            multsDone[val][b] = true;
            multsDone[b][val] = true;
        }
        return new FiniteField(mults[val][b]);
    }

    public FiniteField mult(FiniteField b) {
        return mult(b.val);
    }

    public FiniteField getInverse() {
        return inverse(val);
    }

    public static FiniteField inverse(int a) {
        if (!inverseDone[a]) {
            FiniteField ga = new FiniteField(a);
            for (char i = 0; i <= (1 << 8); i++) {
                if (ga.mult(i).val == 1) {
                    inverseDone[a] = true;
                    inverseDone[i] = true;
                    inverse[a] = i;
                    inverse[i] = a;
                    break;
                }
            }
        }
        return new FiniteField(inverse[a]);
    }

    public static String getBinaryString(int c) {
        String s = "";
        for (int i = 0; i < 9; i++) {
            s = (c % 2) + s;
            c = (c >> 1);
        }
        return "0b" + s;
    }

    public static HashSet<Integer> findGenerators() {
        HashSet<Integer> gs = new HashSet<Integer>();
        for (int j = 1; j < 257; j++) {
            FiniteField gz = new FiniteField(j);
            HashSet<Integer> hs = new HashSet<Integer>();
            hs.add(gz.val);
            for (int i = 2; i < 257; i++) {
                gz = gz.mult(j);
                hs.add(gz.val);
            }
            if (hs.size() == 256) {
                gs.add(j);
            }
        }
        return gs;
    }

}
