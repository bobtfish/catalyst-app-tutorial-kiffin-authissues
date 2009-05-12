package MyApp::Schema::Result::BookAuthor;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("book_author");
__PACKAGE__->add_columns(
  "book_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "author_id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("book_id", "author_id");


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-05-12 13:24:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kPcrQ/RuuVo7OxAEM3YZWQ


# You can replace this text with custom content, and it will be preserved on regeneration

#    
# Set relationships:
#

# belongs_to():
#   args:
#     1) Name of relationship, DBIC will create accessor with this name
#     2) Name of the model class referenced by this relationship
#     3) Column name in *this* table
__PACKAGE__->belongs_to(book => 'MyApp::Schema::Result::Book', 'book_id');

# belongs_to():
#   args:
#     1) Name of relationship, DBIC will create accessor with this name
#     2) Name of the model class referenced by this relationship
#     3) Column name in *this* table
__PACKAGE__->belongs_to(author => 'MyApp::Schema::Result::Author', 'author_id');

1;
