# parallel_tests_demo

This is a contrived example to demonstrate the use of parallel_tests gem (https://github.com/grosser/parallel_tests).

## Setup

1. Bundle install
  ```
  cd parallel_tests_demo
  bundle
  ```

2. Create fillers (1000 symlinks to the same model spec file)
  ```
  cd spec/models/fillers
  ./create_fillers.sh
  cd ../../..
  ```

3. Run rspec and observe the full test time
  ```
  RAILS_ENV=test rake db:create db:migrate

  time bundle exec rspec
  ```

4. Run parallel spec and observe the full test time
  ```
  rake parallel:create parallel:migrate

  RAILS_ENV=test bundle exec parallel:spec
  ```

## Credits
Creating symlinks as fillers is a trick "stolen" from RailsCasts (https://github.com/railscasts/413-fast-tests).
