# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FastImage Resize is an extremely light solution for resizing images in ruby by using libgd"
HOMEPAGE="http://github.com/sdsykes/fastimage_resize"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/RubyInline-3.8.2"
ruby_add_rdepend ">=dev-ruby/fastimage-1.2.9"

