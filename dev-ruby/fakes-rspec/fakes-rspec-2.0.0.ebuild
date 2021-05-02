# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Faking library that allows inspection of received calls after they have been made"
HOMEPAGE="http://www.developwithpassion.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.9.0"
ruby_add_rdepend ">=dev-ruby/guard-2.6.1"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.2.9"
ruby_add_rdepend ">=dev-ruby/fakes-1.1.4"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.1"

