# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Asynchronous mail client and server written in ruby,
                  eventmachine to replace synchronous mail implementation
                  in Rails 2 and 3"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/mail-0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-0"
ruby_add_rdepend ">=dev-ruby/actionmailer-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/em-spec-0"

