# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Async framework for writing API servers"
HOMEPAGE="http://goliath.io/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-synchrony-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-websocket-0.3.8"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.6.0"
ruby_add_rdepend ">=dev-ruby/log4r-0"
ruby_add_rdepend ">=dev-ruby/rack-1.2.2"
ruby_add_rdepend ">=dev-ruby/rack-contrib-0"
ruby_add_rdepend ">=dev-ruby/rack-respond_to-0"
ruby_add_rdepend ">=dev-ruby/async-rack-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-mongo-0.4.0"
ruby_add_rdepend ">=dev-ruby/rack-rewrite-0"
ruby_add_rdepend ">=dev-ruby/multipart_body-0"
ruby_add_rdepend ">=dev-ruby/amqp-0.7.1"
ruby_add_rdepend ">=dev-ruby/em-websocket-client-0"
ruby_add_rdepend ">=dev-ruby/tilt-1.2.2"
ruby_add_rdepend ">=dev-ruby/haml-3.0.25"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/guard-1.8.3"
ruby_add_rdepend ">=dev-ruby/guard-rspec-3.1.0"
ruby_add_rdepend ">=dev-ruby/listen-1.3.1"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-0"
ruby_add_rdepend ">=dev-ruby/bluecloth-0"
#ruby_add_rdepend ">=dev-ruby/bson_ext-0"
ruby_add_rdepend ">=dev-ruby/bson-0"
ruby_add_rdepend ">=dev-ruby/growl-1.0.3"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0"

