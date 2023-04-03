# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="El4r enables you to write Emacs programs in Ruby(EmacsRuby) as well as in EmacsLisp"
HOMEPAGE=""

LICENSE="GNU GPL v2 or later"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


