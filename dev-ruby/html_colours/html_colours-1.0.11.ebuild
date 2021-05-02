# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This small module bundles the HTML Colours together,
    and provides one method to convert those colours to
    the R,G,B values"
HOMEPAGE="http://rubygems.org/gems/html_colours"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


