# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Autoload dotenv in Rails"
HOMEPAGE="https://github.com/bkeepers/dotenv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/dotenv-1.0.2"
ruby_add_rdepend ">=dev-ruby/spring-0"
ruby_add_rdepend ">=dev-ruby/railties-0"

