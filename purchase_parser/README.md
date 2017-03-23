# Purchases Parser

#### Running project:
* #### with docker:

With a recent Docker version run the code bellow at the project directory *(purchase_parser directory)*:

`docker build -t purchase_parser . `

> Sorry for not doing a docker push yet

This command should take some minutes at first time.
After this, run the follow comand to access.

`docker run -p 3000:3000 --net=bridge purchase_parser`

This command would start the service at your **localhost:3000**

* #### without docker:

With correct ruby-version installed (according .ruby-version file), and bundler installed `gem install bundler`, run the follow commands at the project directory:
`bundle install`
`rake db:migrate`
`rails s`

It should start the service  at your **localhost:3000**

### Running specs:
Whereas you built the project as an example without docker above, run `rspec` command at the project root directory.


## Code considerations
* I decided to use a single Purchase model instead of to break it in another models like Customer, Product, Provider, to consider that this is not the point of the test. I can "simply" change my code to build more complex models refactoring the PurchaseFileMapper class.

* I prefer to use fixtures in this case because it's a simple example. As the aplication increases, probably a FactoryGirl shoulb be most appropriate.

* I'm practicing my English ;)
