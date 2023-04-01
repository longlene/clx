# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="EventMachine-LE (Live Edition) is a branch of EventMachine (https://github"
HOMEPAGE="https://github.com/ibc/EventMachine-LE/"

LICENSE="Ruby GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8.3"
ruby_add_rdepend ">=dev-ruby/yard-0.8.5.2"
ruby_add_rdepend ">=dev-ruby/bluecloth-0"

