# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Testing tool that allows for transactionless fixture data within specific contexts (useful in Shoulda and Factory Girl)"
HOMEPAGE="http://github.com/thumblemonks/forklift/tree/master"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


