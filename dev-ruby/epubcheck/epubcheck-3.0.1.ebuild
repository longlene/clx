# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This is a command-line ePub check tool"
HOMEPAGE="http://github.com/jugyo/epubcheck"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


