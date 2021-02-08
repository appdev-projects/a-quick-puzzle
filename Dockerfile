FROM gitpod/workspace-full:latest

# Temporarily reset ~/.rvmrc
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
# AppDev stuff
RUN /bin/bash -l -c "gem install htmlbeautifier"
RUN /bin/bash -l -c "gem install rufo"

WORKDIR /base-rails
COPY Gemfile /base-rails/Gemfile
COPY Gemfile.lock /base-rails/Gemfile.lock

RUN /bin/bash -l -c "gem install bundler:2.1.4"

RUN echo " # No arguments: `git status`\n\
# With arguments: acts like `git`\n\
g() {\n\
  if [[ $# > 0 ]]; then\n\
    git $@\n\
  else\n\
    git status\n\
  fi\n\
}\n\
# Complete g like git\n\
source /usr/share/bash-completion/completions/git\n\
__git_complete g __git_main" > ~/.bash_aliases

USER gitpod

RUN sudo apt install -y postgresql postgresql-contrib libpq-dev psmisc lsof

RUN /bin/bash -l -c "bundle install"

# Set the ~/.rvmrc back
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc

RUN /bin/bash -l -c "curl https://cli-assets.heroku.com/install.sh | sh"

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# # RUN sudo apt-get update && sudo apt-get install -y nodejs yarn postgresql-client
# RUN sudo apt-get update && sudo apt-get install -y yarn
