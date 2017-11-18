#!/bin/bash

vagrant up
bundle install --path vendor/bundle
bundle exec itamae ssh --vagrant recipe.rb
