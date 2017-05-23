# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An open source, Ruby on Rails customer relationship management platform"
HOMEPAGE="http://fatfreecrm.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.2.12"
ruby_add_rdepend ">=dev-ruby/jquery-rails-2.1.4"
ruby_add_rdepend ">=dev-ruby/select2-rails-0"
ruby_add_rdepend ">=dev-ruby/simple_form-2.0.1"
ruby_add_rdepend ">=dev-ruby/will_paginate-0"
ruby_add_rdepend ">=dev-ruby/paperclip-0"
ruby_add_rdepend ">=dev-ruby/cocaine-0"
ruby_add_rdepend ">=dev-ruby/paper_trail-2.7.0"
ruby_add_rdepend "=dev-ruby/authlogic-3.1.0"
ruby_add_rdepend ">=dev-ruby/acts_as_commentable-3.0.1"
ruby_add_rdepend ">=dev-ruby/acts-as-taggable-on-2.3.3"
ruby_add_rdepend ">=dev-ruby/dynamic_form-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/acts_as_list-0.1.4"
ruby_add_rdepend ">=dev-ruby/ffaker-1.12.0"
ruby_add_rdepend ">=dev-ruby/cancan-0"
ruby_add_rdepend ">=dev-ruby/font-awesome-rails-0"
ruby_add_rdepend ">=dev-ruby/premailer-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/responds_to_parent-1.1.0"
ruby_add_rdepend ">=dev-ruby/rails3-jquery-autocomplete-0"
ruby_add_rdepend ">=dev-ruby/valium-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/rails_autolink-0"
ruby_add_rdepend ">=dev-ruby/ransack_ui-1.1.0"
ruby_add_rdepend "=dev-ruby/ransack-1.1.0"
ruby_add_rdepend ">=dev-ruby/email_reply_parser_ffcrm-0"

