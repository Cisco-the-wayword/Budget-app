# Base class for all application-specific models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
