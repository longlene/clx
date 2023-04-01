# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Library for packed binary data stored in ruby Strings"
HOMEPAGE="https://github.com/vjoel/bit-struct"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


