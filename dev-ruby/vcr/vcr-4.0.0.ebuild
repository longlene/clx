# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests"
HOMEPAGE="https://relishapp.com/vcr/vcr/docs"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

