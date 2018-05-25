# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ranking algorithm implementation to Ruby on Rails applications"
HOMEPAGE="http://joaomdmoura.github.com/sigma/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


