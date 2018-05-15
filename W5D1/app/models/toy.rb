class Toy < ApplicationRecord

  validates :name, :toyable_id, :toyable_type, presence: true, uniqueness: true

  belongs_to :toyable, polymorphic: true




end



# The purpose of a polymorphic association is to allow one model to belong to multiple models on a single association. Using as little code as possible, we want to give to corgis, cats, and whatever other cute animals we choose a toys association.
#
# First, create a Toy model and build a polymorphic belongs_to association on toyable. Refer to the polymorphic association reading for syntax. Also, you'll probably want to handle validation of the toy's uniqueness constraint on :name and :toyable (toyable_type and toyable_id in the database). Refer to the Rails documentation for information on uniqueness scope.
#
# Next, build corresponding has_many associations in the Corgi and Cat models. These should both be named toys. Again, refer to the reading.
#
# Run rails db:seed. Check that your associations work as expected.
