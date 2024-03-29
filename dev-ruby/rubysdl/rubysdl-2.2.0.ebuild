# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Ruby/SDL is an extension library to use SDL(Simple DirectMedia
    Layer)"
HOMEPAGE="http://www.kmc.gr.jp/~ohai/rubysdl.en.html"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


