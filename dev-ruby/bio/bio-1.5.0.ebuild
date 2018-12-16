# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="BioRuby is a library for bioinformatics (biology + information science)"
HOMEPAGE="http://bioruby.org/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


