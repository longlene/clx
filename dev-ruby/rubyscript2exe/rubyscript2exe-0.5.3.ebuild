# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Compile ruby applications into a single executable for for easy deployment"
HOMEPAGE="http://www.erikveen.dds.nl/rubyscript2exe"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

RUBY_FAKEGEM_EXTRAINSTALL="realstuff.rb"

