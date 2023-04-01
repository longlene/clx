# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A microframework built on Rack"
HOMEPAGE="http://hansoksendahl.com/bats"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

