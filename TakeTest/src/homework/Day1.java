package homework;
import java.util.Scanner;


public class Day1 {


	    public static void main(String[] args) {
	      
	        Scanner scanner = new Scanner(System.in);
	
	        int score = scanner.nextInt();
   
	        String grade;
	        if(score==100) {
	        	 grade = "S";
	        }else if (score >= 90 && score < 100) {
	            grade = "A";
	        } else if (score >= 80 && score < 90) {
	            grade = "B";
	        } else if (score >= 70 && score < 80) {
	            grade = "C";
	        } else if (score >= 60 && score < 70) {
	            grade = "D";
	        } else if (score >= 0 && score < 60) {
	            grade = "E";
	        } else {
	            grade = "不能輸入0-100以外的數字";
	        }

	        System.out.println("等級為：" + grade);

	        scanner.close();
	    }
	}


