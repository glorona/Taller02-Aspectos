package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	
    pointcut success() : call(* create*(..) );
    after() : success() {
    		
    		System.out.println("**** User created ****");
    
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    }

    
    pointcut deposito() : call(* moneyMakeTransaction*(..) );
    after() : deposito() {
    	try {
    		FileWriter fw = new FileWriter("log.txt",true);
    		
    		String fecha = String.valueOf(cal.get(Calendar.YEAR)) + "-" +  String.valueOf(cal.get(Calendar.MONTH)) + "-" + String.valueOf(cal.get(Calendar.DATE)) + " " +  String.valueOf(cal.get(Calendar.HOUR)) + ":" + String.valueOf(cal.get(Calendar.MINUTE));
    		fw.write(fecha + " Deposito Realizado." + "\n");
    		System.out.println("**** Deposito Realizado ****");
    		fw.close();
    	}
    	catch(IOException E) {
    		System.out.println("Ha ocurrido un error escribiendo el archivo log");
    		E.printStackTrace();
    		
    	}
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	
    }
    
    
    
}