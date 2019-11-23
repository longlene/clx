# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner"
HOMEPAGE="https://github.com/rails-api/active_model_serializers"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.1"
ruby_add_rdepend ">=dev-ruby/actionpack-4.1"
ruby_add_rdepend ">=dev-ruby/railties-4.1"
ruby_add_rdepend ">=dev-ruby/jsonapi-renderer-0.1.1"
ruby_add_rdepend ">=dev-ruby/case_transform-0.2"
ruby_add_rdepend ">=dev-ruby/activerecord-4.1"
ruby_add_rdepend ">=dev-ruby/kaminari-0.16.3"
ruby_add_rdepend ">=dev-ruby/will_paginate-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/simplecov-0.11"
ruby_add_rdepend ">=dev-ruby/timecop-0.7"
ruby_add_rdepend ">=dev-ruby/grape-0.13"
ruby_add_rdepend ">=dev-ruby/json_schema-0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

