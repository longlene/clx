# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Monkeypatching Net::HTTP to use em-http-request under the hood"
HOMEPAGE="http://github.com/jfairbairn/em-net-http"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.10"
ruby_add_rdepend ">=dev-ruby/addressable-0"
ruby_add_rdepend ">=dev-ruby/em-http-request-0.2.10"
ruby_add_rdepend ">=dev-ruby/rspec-2.5"
ruby_add_rdepend ">=dev-ruby/mimic-0.3.0"
ruby_add_rdepend ">=dev-ruby/weary-0"

