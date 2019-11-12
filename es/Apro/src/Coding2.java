// you can also use imports, for example:
// import java.util.*;
import java.util.ArrayList;
import java.util.List;
// you can write to stdout for debugging purposes, e.g.
// System.out.println("this is a debug message");

class Coding2 {
    public int solution(int M, int N) {
        List<Integer> list = new ArrayList<Integer>();
	    int cnt = 0;

	    for(int i = M; i <= N; i++) {
	        list.add(i);
	    }
	  
	    while(list.size() / 2 > cnt+1) {
	        int tmp = list.get(cnt);
	        tmp ^= list.get(cnt+1);
	        list.set(cnt+1, tmp);
	        
	        int tmp2 = list.get((list.size()-1)-cnt);
	        tmp2 ^= list.get((list.size()-2)-cnt);
	        list.set((list.size()-2)-cnt, tmp2);
	        
	        cnt++;
	    }
	    
	    if(list.size()%2 == 0) {
	       int tmp1 = list.get(list.size()/2-1);
	       tmp1 ^= list.get(list.size()/2);
	       return tmp1;
	    }
	    else {
	       int tmp2 = list.get(list.size()/2);
	       int tmp3 = list.get(list.size()/2 - 1);
	       int tmp4 = list.get(list.size()/2 + 1);
	        
	       tmp3 ^= tmp2;
	       tmp4 ^= tmp2;
	       tmp2 ^= tmp4;
	       return tmp2;
	    }  
    }
}