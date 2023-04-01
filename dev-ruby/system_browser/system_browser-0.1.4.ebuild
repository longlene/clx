# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Powers System Browser Client, which is a desktop application that displays information about Ruby classes and modules, showing both methods and their source code"
HOMEPAGE="https://github.com/kyrylo/system_browser_server"

LICENSE="Zlib"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/system_navigation-0"
ruby_add_rdepend ">=dev-ruby/core_classes-0"
ruby_add_rdepend ">=dev-ruby/coderay-1.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/pry-0.10"

