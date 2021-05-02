# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides charset detection, locale sensitive collation and more"
HOMEPAGE="http://github.com/jarib/ffi-icu"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.5.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

