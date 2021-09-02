# README

Step By Step Guide  :)

1. First we made app by command:
	rails new webapp
	which will setup all required things..
  
 

2. Created Models/Tables -> Ads, Users, Comments with command:
	>rails g model model_name attrib_name:data_type		
  
	
3.	And Establish relationship between models..
	Then made schema in database by command:
	>	rails db:migrate		
	
4. 	However doing so was not straight forward..
	  and hence in accomplishing objective i explored following commands;
	
>	rails g migration AddFieldToModel_Name attrib:data_type  	

5. to update existing model
	> rails db:rollback											
  > to do rollback in database
	
	
	
6. Made Serializers for above tables because we are asked to create  
 *REST Architecture*
	and did so by using command:
	>rails g model_nameSerializer attrib_name:data_type	
	

7.	to view all routes/endpoints available
	>rails routes 		
	
	
	
8. Added Controllers For Handling Different Routes where we specified what data to pass on each endpoints..
	
	*Important*
		@options ||= {include: %i[comments]}
		
		Due to this, i could access the comments by just calling Ads_Api only bcuz data will include all the models which uses 
		ads as foreign key (it is Comments Table in this case :)   ) and hence reduced number of api_calls .
		
		
		

9. Added Authentication using  JWT

7. Used Cors to manage Cross Origin Resource Sharing (CORS).


8. Run Server using command:  I didn't use default port hence specified port :)

	>rails s -p: port 		


9. While deploying on Heroku, i found that it requires postgre, i installed that and required gem, but i was facing error 
  which i could not resolve after doing a lot of sufing, hence i couldn't deploy.
  
  ![WhatsApp Image 2021-08-29 at 10 07 49 PM (5)](https://user-images.githubusercontent.com/54207145/131257802-13cb80e3-ab6f-4676-be68-7e034252b841.jpeg)
