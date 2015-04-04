Quiz: Lesson 2


1. Name all the 7 (or 8) routes exposed by the resources keyword in the routes.rb file.
Also name the 4 named routes, and how the request is routed to the controller/action.

get posts_path /posts posts#index
post /posts posts#create
get /posts/new posts#new
get /posts/:id/edit posts#edit
get /posts/:id posts#show
patch /posts/:id posts#update
put /posts/:id posts#update

named routes:
posts_path
new_post_path
edit_post_path
post_path

2. What is REST and how does it relate to the resources routes?

REST stands for Representational State Transfer. Resource routing allows you to quickly declare all of the 
common routes for a given resourceful controller. Instead of declaring separate routes for your index, show,
new, edit, create, update and destroy actions, a resourceful route declares them in a single line of code.

3. What's the major difference between model backed and non-model backed form helpers?

Model backed helper forms are actually bound to objects directly usually for crud applications. 
Non-model backed form helpers are used for situations where a model form is not suitable.

4. How does form_for know how to build the <form> element?

A particularly common task for a form_for is editing or creating a model object. Rails provides 
helpers tailored to this task.

<%= form_for @article do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :body  %>
  <%= f.submit "Create" %>
<% end %>

5. What's the general pattern we use in the actions that handle submission of model-backed forms
(ie, the create and update actions)?

def create 
  @article = Article.new(params.require(:article).permit(:title, :body))

  if @article.save
      flash[:notice] = "Your article has been saved."
      redirect_to articles_path
  else
      render :new
  end
end

def update
  @article = Article.find(params[:id])

  if @article.update(params.require(:article).permit(:title, :body))
      flash[:notice] = "Your article has been updated."
      redirect_to article_path(@article)
  else
      render :edit
  end
end


6. How exactly do Rails validations get triggered? Where are the errors saved? How do we show the validation 
messages on the user interface?

Validations are placed at the model layer. They are coded in the model definition itself.

When `Post.first.errors.full_messages` is passed to a block, you can extract any errors. 

 <% if Post.errors.any? %>
    <div class="row">
      <div class="alert alert-error span 8">
        <h5> Please fix the following errors:</h5>
          <ul>
            <% Post.errors.full_messages.each do |msg| %>
              <li><%= msg %></li>
            <% end %>
          </ul>
      </div>
    </div>
  <% end %>

7. What are Rails helpers?

Rails “helpers” are very specifically view helpers. They’re automatically included in views, 
but not in controllers or models.

8. What are Rails partials?

Partial templates - are a device for breaking the rendering process into more manageable chunks. 
With a partial, you can move the code for rendering a particular piece of a response to its own file.

9. When do we use partials vs helpers?

Code in the application helper is included in all the views in your application. 
Code in other helpers is included in the corresponding view. If you are writing big loops, 
method calls or other logic in the view but it’s clearly display logic, move it into a method in the helper.

Partial templates are another device for breaking the rendering process into more manageable chunks. 
With a partial, you can move the code for rendering a particular
piece of a response to its own file. It should consist of code that is for presentation purposes only. 

10. When do we use non-model backed forms?

Non-model forms are not bound to an object. Use them when you're doing something not straight up CRUD based.
They simply generate straight up html forms. It is up to the programmer to understand how html forms work.