# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

RUBY_FAKEGEM_NAME="binding.repl"
inherit ruby-fakegem

DESCRIPTION="binding.pry for all ruby consoles"
HOMEPAGE="https://github.com/rpag/binding.repl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x86"
IUSE=""


