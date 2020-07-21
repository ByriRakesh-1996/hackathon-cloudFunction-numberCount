package com.hackathon.cloud.function;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

/*Finding number of occurances of a digit in a generated Fibonacci series*/
public class FunctionApp {
	private static final Logger Logger = LoggerFactory.getLogger(FunctionApp.class);
	
	public static JsonObject main(JsonObject input) {
		 String series=input.getAsJsonPrimitive("FibonacciSeries").getAsString();
		 String removeBraces=series.replace("[", "").replace("]", "");
		 String[] message = removeBraces.split(",", -1);
	    int count=0,k;
		for(int i=0;i<message.length;i++) {
			  k= Integer.parseInt(message[i].trim()); 
			  while (k > 0) { 
				  if (k % 10 ==input.get("digit").getAsInt())
					  count++;
				      k = k / 10;
				  }
		}
		input.addProperty("Number of Occurances of "+input.get("digit")+" digit is  ", count);
		Logger.info(input.toString());
		return input;
	}
}
