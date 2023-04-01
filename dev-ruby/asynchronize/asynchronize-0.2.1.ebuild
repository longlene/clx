# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Take any synchronous method, and run it asynchronously, without cluttering your code with repetetive boilerplate"
HOMEPAGE="https://github.com/kennycoc/asynchronize"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


