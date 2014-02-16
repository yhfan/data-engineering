# Simple Data Importer
This is a web-based data importer that allows the user to import the data from a tab-delimited text file by uploading the file via the web UI.  The application is written in Ruby on Rails.  There is no authorization or authentication.

## Installation and Setup
Here are the steps:

1. Make sure you have ruby, rubygems, bundler, and rails installed.
2. Clone or download the repository to your machine.
3. Go to the root directory of the application (`import_data/`).
4. Install the necessary ruby gems by typing `bundle install`.
5. If you want to use the default databases, then you may skip step 6.
6. If you want to use other databases, then you need to
 a. modify `config/database.yml`,
 b. run `bin/rake db:create:all` to create them, and
 c. run `bin/rake db:migrate` to set up the schema.
7. Start the server by typing `bin/rails s`.

## Usage
Here are the steps:

1. Open your web browser and enter the URL of `http://localhost:3000`.
2. After the page has loaded, click on the "File" button in the page to select the file to upload.
3. After you have selected the file, click on the "Upload" button to start importing the data from the selected file.
4. If the data are imported successfully, a message showing the success and the gross revenue will be displayed at the top of the page.
5. If an error is encountered, a generic error message will be displayed at the top of the page to indicate it.

