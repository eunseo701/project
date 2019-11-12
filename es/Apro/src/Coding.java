import java.util.ArrayList;
import java.util.List;

public class Coding {
	public List<Integer> listTest(int n, int m){
	     
	      List<Integer> list = new ArrayList<Integer>();
	      int cnt = 0;

	      for(int i = n; i <= m; i++) {
	         list.add(i);
	      }
	  
	      while(list.size() / 2 > cnt+1) {
	         int tmp = list.get(cnt);
	         tmp ^= list.get(cnt+1);
	         list.set(cnt+1, tmp);
	        
	         int tmp2 =list.get((list.size()-1)-cnt);
	         tmp2 ^= list.get((list.size()-2)-cnt);
	         list.set((list.size()-2)-cnt, tmp2);
	        
	         cnt++;
	      }
	     
	      return list;
	   }

	   public static void main(String[] args) {
	      System.out.println("test");
	      Coding c = new Coding();
	      List<Integer> a = c.listTest(5, 8);
	     
	      int result;
	     
	      if(a.size()%2 == 0) {
	         int tmp1 = a.get(a.size()/2-1);
	         tmp1 ^= a.get(a.size()/2);
	         result = tmp1;
	         System.out.println("=="+tmp1+"==");
	      }
	      else {
	         int tmp2 = a.get(a.size()/2);
	         int tmp3 = a.get(a.size()/2 - 1);
	         int tmp4 = a.get(a.size()/2 + 1);
	        
	         tmp3 ^= tmp2;
	         tmp4 ^= tmp2;
	         tmp2 ^= tmp4;
	        
	         result = tmp2;
	         System.out.println("++"+tmp2+"++");
	      }  
	   }
}
