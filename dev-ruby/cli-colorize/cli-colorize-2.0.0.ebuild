# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The cli-colorize gem is a command-line interface colorization library"
HOMEPAGE="https://github.com/stjohncj/cli-colorize"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


