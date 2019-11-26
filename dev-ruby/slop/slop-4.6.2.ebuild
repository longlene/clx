# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A DSL for gathering options and parsing command line flags"
HOMEPAGE="http://github.com/leejarvis/slop"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

