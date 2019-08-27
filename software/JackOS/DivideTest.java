public class DivideTest {
   public static void main(String[] args) {
      int r = divide(-18000, 6);
      System.out.println(r);
   }
   
   static int divide(int x, int y) {
     int q;
     
     // deals with negative input
     boolean negativeQuotient = false;
     if((x < 0 && y >= 0) || (x >= 0 && y < 0)) {
         negativeQuotient = true;
     }
     x = Math.abs(x);
     y = Math.abs(y);
     
     if(!(x < 0) && (y > 0)) { // x must be non-negative, y must be positive to pass
         if(y > x) {
             return 0; // denominator is larger than numerator so quotient < 1 (it is truncated)
         } 

         q = divide(x, y + y); // divide(x, 2 * y)

         if((x - 2*q*y) < y) {
             if(negativeQuotient) {
                  return -(q+q);
             }
             return q + q; // return 2 * q
         } else {
             if(negativeQuotient) {
                  return -(q+q+1);
             }
             return q + q + 1; // return (2 * q) + 1
         }
         
     } else {
         return 0;
     }
   }
}