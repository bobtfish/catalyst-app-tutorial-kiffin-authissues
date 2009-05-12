package MyApp::Schema::Result::Role;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("role");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "role",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-05-12 13:24:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5XWK2wwUxFJ1rpZOmzAPtQ


# You can replace this text with custom content, and it will be preserved on regeneration

#
# Set relationships:
#
    
# has_many():
#   args:
#     1) Name of relationship, DBIC will create accessor with this name
#     2) Name of the model class referenced by this relationship
#     3) Column name in *foreign* table (aka, foreign key in peer table)
__PACKAGE__->has_many(map_user_role => 'MyApp::Schema::Result::UserRole', 'role_id');
 

1;
