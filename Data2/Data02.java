import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
class Person
{
	public String pid;
	public double latitude;
	public double longetude;
	Person()
	{}
	Person(String a, String b, String c)
	{
		pid=a.trim();
		latitude=Float.parseFloat(b);
		longetude=Float.parseFloat(c);
	}
	public void display()
	{System.out.printf(pid+"  %f  %f\n",latitude,longetude);}
}

class Project
{
	public String pid;
	public double latitude;
	public double longetude;
	public double mind1=999;
	public double mind2=999;
	public double mind3=999;
	public double avemind;
	public double minpp=999;
	public double mine1=999;
	public double mine2=999;
	public double mine3=999;
	public double avemine;
	public double s_io;
	public double c_io;
	public double u_d=0;
	public double u_i;
	public int u_n=1;
	public double n_p;
	
	
	Project ()
	{}
	Project(String a,String b,String c)
	{
		pid=a.trim();
		latitude=Float.parseFloat(b);
		longetude=Float.parseFloat(c);
	}
	public void setpid(String n)
	{pid=n;}
	public void setlatitude(String n)
	{latitude=Float.parseFloat(n);}
	public void setlongetude(String n)
	{longetude=Float.parseFloat(n);}
	public void display()
	{System.out.printf(pid+"  %f  %f  %f  %f  %f  %d\n",latitude,longetude,avemind,avemine,n_p,u_n);}
}


public class Data02
{
	public static void main(String[] args) throws IOException 
	{
		int n=0,m=0;
		int i,j;
		Project[] a = new Project[2500];
		Person[] b = new Person[2000];
		
		
		FileReader fr = new FileReader("E:\\B\\f3.txt");
	    BufferedReader br = new BufferedReader(fr);  
	   
	    String temp = null;
	    while ((temp = br.readLine()) != null)
	    {
	        String[] dat = temp.split("   "); 
			a[n] = new Project(dat[0],dat[1],dat[2]);
	       // System.out.println(Float.parseFloat(dat[1]));
//	        a[n].display();
	        n++;
	    }
	    br.close();
	    
	    
		FileReader ft = new FileReader("E:\\B\\f2.txt");
		br = new BufferedReader(ft);
		while ((temp = br.readLine()) != null)
	    {
	        String[] dat = temp.split("	"); 
			b[m] = new Person(dat[0],dat[1],dat[2]);
//	        System.out.println(dat[1]);
//	        b[m].display();
	        m++;
	        
	    }
	    br.close();
	    
	    
	    for(i = 0; i<n ; i++)
	    {
	    	for(j = 0 ; j<n ;j++)
	    	{
	    		if(i == j)
	    			continue;
	    		else
	    		{
	    			double d_t = Math.sqrt((a[i].latitude-a[j].latitude)*(a[i].latitude-a[j].latitude)+(a[i].longetude-a[j].longetude)*(a[i].longetude-a[j].longetude));
	    			if(d_t<a[i].mind3)
	    			{
	    				a[i].mind3=a[i].mind2;
	    				a[i].mind2=a[i].mind1;
	    				a[i].mind1=d_t;
	    			}
	    			if(d_t<0.004)
	    			{
	    				a[i].u_d+=d_t;
	    				a[i].u_n++;
	    				
	    			}

	    		}
	    		
	    	}
	    	
	    	a[i].avemind=(a[i].mind1+a[i].mind2+a[i].mind3)/3;
	    	//a[i].display();
	    }
	    
		double sum=0;
	    for(i = 0; i <n ;i++)
	    {
	    	sum+=a[i].avemind;
	    }
    	//System.out.print(sum/n);
	    
	    
	    
	    
	    for(i = 0; i<n ; i++)
	    {
	    	for(j = 0 ; j<m ;j++)
	    	{

	    		double d_t = Math.sqrt((a[i].latitude-b[j].latitude)*(a[i].latitude-b[j].latitude)+(a[i].longetude-b[j].longetude)*(a[i].longetude-b[j].longetude));
	    		if(d_t<a[i].mine3)
	    		{
	    			a[i].mine3=a[i].mine2;
	    			a[i].mine2=a[i].mine1;
	    			a[i].mine1=d_t;
	    		}

	    	}

		    a[i].avemine=(a[i].mine1+a[i].mine2+a[i].mine3)/3;
		    a[i].avemine+=0.053;
	    	if(a[i].u_d==0)
	    		a[i].u_d+=a[i].avemine;
	    	
		    //a[i].display();
	    }
    	FileOutputStream fs = new FileOutputStream(new File("E:\\B\\new ob1.txt"));
		PrintStream p = new PrintStream(fs);
	    for(i = 0 ; i < n;i++)
	    {
	    	a[i].n_p = 6576.022535*a[i].avemine/6;
	    	if(a[i].n_p<40)
	    		a[i].n_p=40;
	    	if(a[i].n_p>100)
	    		a[i].n_p=100;

			p.printf("%s  %f  %f  %f  %f  %f  %d\n",a[i].pid,a[i].latitude,a[i].longetude,a[i].avemind,a[i].avemine,a[i].n_p,a[i].u_n);
	    	System.out.println(i);
	    	
	    	//a[i].display();
	    }
	    p.close();
//	    a[0].display();
//	    a[1].display();
	    
	    

	}

}

