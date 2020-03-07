# UneeQ Orchestration Layer in Ruby / Sinatra with Google Dialogflow

This repository exists as a quick deploy option for a UneeQ Orchestration layer connecting to Google Dialogflow.

**This repository is provided as-is.  No warranty, express or implied**

All aspects of UneeQ's platform are integrated.  You can pass **emotionalTone** or **expressionEvent** as parameters from within Dialogflow and they will be added into the JSON response to UneeQ and interpreted by the rendering engine.

If you are seeing this repository, you've likely received this link from a UneeQ employee, so please work with that employee if you have any questions, though as the above message clearly states, the repository is provided as-is.

In order to run this within a platform such as Elastic Beanstalk or Heroku or Google AppEngine, you will need to set some environment variables:

* GOOGLE_APPLICATION_CREDENTIALS
* GCP_CREDS
* DIALOGFLOW_LANG
* GOOGLE_PROJECT_ID
  
If you aren't familiar with Dialogflow - you can read about it's authentication scheme here: https://cloud.google.com/docs/authentication/getting-started

In the case of Heroku, there is no local file system as Heroku uses an efemeral filesystem that is wiped each time your application deploys.  As a result, there is no access to the local JSON credentials file that Google requires.  For that reason, we can set the environment variable GCP_CREDS to the JSON contents of the authentication file you will download from Google, and on start of the app, a simple function writes the JSON contents to the appropriate file locally satisfying Google's authentication requirement.  

Personally I prefer this to implementing an entire OAuth procedure, which Google does support, but requires a lot more time and effort and is liable to change in the future.  

As with Heroku, if you were to terminate an Elastic Beanstalk environment you would also lose local files, whereas this work-around with writing the credentials to the appropriate file on application start works across restarts and new environment builds.

While I haven't built this on a GCP-equivalent or Azure-equivalent, I venture a guess that the process works best as written.
