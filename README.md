# Udemy Course: The Complete DBT Bootcamp
https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/

## Overview:
This course showcased using the dbt-snowflake connector and several dbt functionalities. 
- Workflow materializations
- Modeling
- Testing (Sigular, Generic, Macros, Custom Sigular, Imported Macros)
- Debugging Cases and Workflows
- Connecting to Snowflake
- Documentation 
- DBT Documentation website creation 

## Business Case:
While on doing yoga in Kuaui during a full moon, the manager had a realization. Full moons where impacting their emotions at the retreat. Puzzled by this, a call is made to review the Airbnb customer reviews to have a raw count of all review sentiment for during a full moon and not during a full moon. Being that the data sources or data warehouse does not yet exist, a process is created to source the data and establish a data pipleine into Snowflake and create a simple Dashboard for the manager. 


## Requirements:
To successfully run this project, you will need the following:
- A Snowflake account
- Pre loaded Snowflake database (Please C&P Snowflake_init.txt into your Snowflake account)
- Creation of virtual envrionment of repo 


## Initilization Steps:
1. Create Snowflake account or new database 
   - Copy and Paste the Snowflake_init.txt contents into a new Snowflake worksheet
   - Populate the raw data with the embeded queries  
   - Copy AWS, Azure or cloud id used with the Snowflake account 
2. Clone repo and create a virtual envrionment from the cloned repo directory 
   - Initalize the virtual envrionment in terminal enter -> . venvn/bin/activate
   - Pip install dbt-snowflake=1.2.0
   - Create snowflake connection profile using by creating a profiles.yml file or by using the CLI to create it
    - Landing file location is ~/.dbt
profiles.yml structure    
```
dbtlearn:
  outputs:
    dev:
      account: AWS account or cloud account used to store data for Snowflake
      database: airbnb
      password: What you created 
      role: transform (Or what you called it)
      schema: dev
      threads: 12
      type: snowflake
      user: dbt
      warehouse: COMPUTE_WH
  target: dev
```

3. cd back to working directory and validate dbt is installed with no errors by entering in terminal -> dbt debug
  - Repeat step 2 if debug is failing on profiles.yml
    - Use yamllint.com to validate your yaml if errors percist 
  - Verify you are CDd to the repo home path if failing on dbt_profiles.yml

4. With all green from the dbt debug, you can now run the following commands
- dbt debug (Validate everything is connected)
- dbt run
- dbt test
- dbt docs generate
  - dbt docs serve

5. To see the DAGs and link to simple dashboard, please render the dbt lightweight website. 
- In terminal with vevn running, enter the command "dbt docs generate", then "dbt docs serve"
- This will render you to the modeling documentation and business logic for the test cases and macros used within the process. 


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
