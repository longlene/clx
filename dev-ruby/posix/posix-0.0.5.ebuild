# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Wrappers for some posix functions that I couldn't find in the stdlib"
HOMEPAGE="http://github.com/richo/ruby-posix"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


