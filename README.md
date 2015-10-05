#### Polymorphic associations in Ruby on Rails allow you to have a model associated with more than one other model without the use of a join table. 
This works by adding type and id field to the table of the model you wish to make polymorphic. 

    rails g model Person first_name last_name
    rails g model Business name
    rails g model Interaction description interactive:references{polymorphic}

    rake db:migrate
    rails server

#### For example, lets say we have 3 models. The first 2 models, Business and Person, each can have interactions associated with them.
These interactions share the same business logic regardless of the associated model so we can easily make interactions polymorphic.

#### The third model, Interaction, will store simple descriptions of various phone calls and other interactions that the user has had. 

    # app/models/person.rb:
    class Person < ActiveRecord::Base
      has_many :interactions, as: :interactive
    end

    #app/models/business.rb:
    class Business < ActiveRecord::Base
      has_many :interactions, as: :interactive
    end

    #app/models/business.rb:
    class Interaction < ActiveRecord::Base
      belongs_to :interactive, polymorphic: true
    end

#### To test check the rails console

    rails console
    Interaction.column_names

Now if we open up a rails console using the rails console command 
notice that there are two columns, interactive_id, and interactive_type. 
The interactive_type column holds the type of the model that the interaction belongs to. 
The interactive_id holds the id of the model that the interaction belongs to. 

#### Now create all 3 controllers:
  The final controller, Interactions, will handle the saving of each interaction. 

    rails g controller People index show new create edit update
    rails g controller Businesses index show new create edit update
    rails g controller Interactions new create edit update

Then add all controller code to each view... 

    mv README.rdoc README.md
    bundle exec erd
    open erd.pdf # to see a visual 

Either screenshot or save .pdf as .png

Move it to assets folder 

Add it to your README.md 

![associations icon](https://github.com/un5t0ppab13/associations/blob/master/app/assets/images/erd.png)