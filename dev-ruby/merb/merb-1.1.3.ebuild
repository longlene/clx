# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Merb stack"
HOMEPAGE="http://merbivore.com/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/merb-action-args-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-assets-1.1.3"
ruby_add_rdepend ">=dev-ruby/merb-auth-1.1"
ruby_add_rdepend "=dev-ruby/merb-cache-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-exceptions-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-gen-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-haml-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-helpers-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-mailer-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-param-protection-1.1.3"
ruby_add_rdepend "=dev-ruby/merb-slices-1.1.3"
ruby_add_rdepend ">=dev-ruby/merb_datamapper-1.1"
ruby_add_rdepend ">=dev-ruby/data_mapper-0.10.0"
ruby_add_rdepend ">=dev-ruby/do_sqlite3-0.10.0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

