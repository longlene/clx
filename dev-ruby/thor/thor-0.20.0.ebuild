# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Thor is a toolkit for building powerful command-line interfaces"
HOMEPAGE="http://whatisthor.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

