package Questions;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class MinDistSrcToDist{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int A = sc.nextInt();
        int[][] B = new int[A][3];
        for(int i = 0; i < A; i++){
            for(int j = 0; j < 3; j++){
                B[i][j] = sc.nextInt();
            }
        }
        int C = sc.nextInt();
        int D = sc.nextInt();
        System.out.println(solve(A, B, C, D));
    }

    private static int solve(int A, int[][] B, int C, int D) {
        if(C==D) return 0;
        ArrayList<Integer>[] adjaceny = new ArrayList[A+ B.length + 1];
        // this is array of adjaceny list and the size if such that
        // A = no. of nodes, B.length = no. of edges (+1 for safety)
        for(int i = 0; i < adjaceny.length; i++){
            adjaceny[i] = new ArrayList<Integer>();
        }
        int dummyNodeVal = A+1; // we have A nodes hence the dummyNodeVal starts from next val

        for(int i = 0; i < B.length; i++){
            int node1 = B[i][0], node2 = B[i][1], wt = B[i][2];
            if(wt == 2){
                adjaceny[node1].add(dummyNodeVal);
                adjaceny[dummyNodeVal].add(node1);

                adjaceny[node2].add(dummyNodeVal);
                adjaceny[dummyNodeVal].add(node2);
                dummyNodeVal++;
            } else{
                adjaceny[node1].add(node2);
                adjaceny[node2].add(node1);
            }
        }

        boolean[] isVisited = new boolean[adjaceny.length];
        Queue<Integer> q = new LinkedList<>();
        q.add(C);
        isVisited[C] = true;
        int dist = 0;

        while(!q.isEmpty()){
            int size = q.size();
            dist++;
            for(int k = 0; k < size; k++){
                int source = q.poll();
                ArrayList<Integer> list = adjaceny[source];
                for(int i : list){
                    if(i == D) return dist;
                    if(!isVisited[i]){
                        q.add(i);
                        isVisited[i] = true;
                    }
                }

            }
        }
        return -1;
    }

}